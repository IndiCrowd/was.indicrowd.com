package com.indicrowd.shop;

import java.io.IOException;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indicrowd.AbstractController;
import com.indicrowd.ListInfo;

@Controller
@RequestMapping("/item")
public class ItemController extends AbstractController {

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(@ModelAttribute("command") Item item,  Model model) {
		model.addAttribute("shops", Shop.findAllShops());
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("command") Item item, BindingResult bindingResult, Model model) throws IOException {
		
		if (!bindingResult.hasFieldErrors("profilePhoto") && (item.getProfilePhoto() == null || item.getProfilePhoto().getSize() == 0 || !imageService.isImageFile(item.getProfilePhoto()))) {
			bindingResult.rejectValue("profilePhoto", "NotImage.profilePhoto");
		}
		if (!bindingResult.hasFieldErrors("image") && (item.getImage() == null || item.getImage().getSize() == 0 || !imageService.isImageFile(item.getImage()))) {
			bindingResult.rejectValue("image", "NotImage.image");
		}
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("shops", Shop.findAllShops());
			return "item/create";
		} else {
			
			if (item.getShopId() != null) {
				item.setShop(Shop.findShop(item.getShopId()));
			}
			
			item.setCreator(authService.getUserInfo());
			item.setCreateDate(new Date());
			item.persist();
			
			fileService.save(item.getProfilePhoto(), "itemphoto/" + item.getId().toString(), true);
			fileService.save(imageService.generateThumb(item.getProfilePhoto()), "itemthumb/" + item.getId().toString(), true);
			
			fileService.save(item.getImage(), "itemimage/" + item.getId().toString(), true);
			
			return "redirect:/item/list";
		}
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public void update(@PathVariable Long id) {
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void remove(@PathVariable Long id) {
	}

	@RequestMapping("/list")
	public void list(Model model) {
		model.addAttribute("shops", Shop.findAllShops());

		ListInfo<Item> listInfo = new ListInfo<Item>();

		listInfo.setPage(1);
		listInfo.setCountPerPage(-1);
		listInfo.setCount(Item.countItems());
		
		// 우선 전체 다 가져옴
		listInfo.setList(Item.findAllItems());

		model.addAttribute("command", listInfo);
	}

	@RequestMapping("/list/{page}")
	public void list(@PathVariable Long page) {
	}

}
