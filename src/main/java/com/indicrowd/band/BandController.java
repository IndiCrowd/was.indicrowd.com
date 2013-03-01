package com.indicrowd.band;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indicrowd.post.Comment;
import com.indicrowd.post.Post;
import com.indicrowd.tag.Tag;

@Controller
@RequestMapping("/band")
public class BandController {

	@RequestMapping("/home")
	public String bandHome(Model model) {
		List<BandInfo> bandInfoList = BandInfo.findAllBandInfoes();
		List<Tag> tagList = Tag.findAllTags();
		model.addAttribute("bandInfoList", bandInfoList);
		model.addAttribute("tagList", tagList);
		return "band/home";
	}
	
	@RequestMapping(value = "/{bandId}", method = RequestMethod.GET)
	public String bandBlog(@PathVariable("bandId") Long bandId,Model model){
		BandInfo bandInfo = BandInfo.findBandInfo(bandId);
		if(bandInfo == null){
			System.out.println("밴드 정보가 없습니다.");
		}else{
			String category = bandInfo.getCategory();
			
			String[] tags = category.split(" ");
			model.addAttribute("tags",tags);
			List<Post> recentPostList = Post.findPostsByBandId(bandId, 1, 5);
			
			model.addAttribute("recentPostList",recentPostList);
		}
		model.addAttribute("bandInfo", bandInfo);
		return "band/blog";
	}
	
	@RequestMapping(value ="/{bandId}/post/{postId}", method = RequestMethod.GET)
	public String postPage(@ModelAttribute("command") Comment comment,@PathVariable("bandId") Long bandId, @PathVariable("postId") Long postId, Model model){
		BandInfo bandInfo = BandInfo.findBandInfo(bandId);
		if(bandInfo == null){
			System.out.println("밴드 정보가 없습니다.");
		}else{
			String category = bandInfo.getCategory();
			
			String[] tags = category.split(" ");
			model.addAttribute("tags",tags);
		}
		Post post = Post.findPost(postId);
		model.addAttribute("post", post);
		model.addAttribute("commentList",post.getCommentList());
		model.addAttribute("bandInfo", bandInfo);
		return "band/post";
	}
	
	@RequestMapping(value = "/create" , method = RequestMethod.GET)
	public void create(@ModelAttribute("command") BandInfo bandInfo){
		
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@ModelAttribute("command") BandInfo bandInfo,BindingResult bindingResult, Model model){
		if (bindingResult.hasErrors()) {
			return "band/create";
		} else {
			bandInfo.persist();
			//return "redirect:/concert/" + concert.getId();
			return "band/create";
		}
	}
}
