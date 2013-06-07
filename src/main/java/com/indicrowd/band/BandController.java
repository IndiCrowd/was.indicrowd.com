package com.indicrowd.band;

import java.io.IOException;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.validation.Valid;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.indicrowd.AbstractController;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.post.Comment;
import com.indicrowd.post.Post;
import com.indicrowd.tag.Tag;
import com.indicrowd.user.model.UserInfo;
import com.indicrowd.video.model.Video;

@Controller
@RequestMapping("/band")
@SessionAttributes({"postedit"})
public class BandController extends AbstractController{
	
	@Autowired
	BandService bandService;

	@RequestMapping("/home")
	public String bandHome(Model model) {
		List<BandInfo> bandInfoList = BandInfo.findAllBandInfoes();
		Collections.reverse(bandInfoList);
		
		List<Tag> tagList = Tag.findAllTags();
		model.addAttribute("bandInfoList", bandInfoList);
		model.addAttribute("tagList", tagList);
		
		return "band/home";
	}
	
	@RequestMapping(value = "/{bandId}", method = RequestMethod.GET)
	public String bandBlog(@PathVariable("bandId") Long bandId,Model model){
		BandInfo bandInfo = BandInfo.findBandInfo(bandId);
		if(bandInfo == null){
			
		}else{
			String category = bandInfo.getCategory();
			List<Concert> concertList = Concert.findConcertListByBand(bandInfo.getId());
			String[] tags = category.split(" ");
			List<Post> recentPostList = Post.findPostsByBandId(bandId, 1, 5);
			List<Video> videoList = Video.findVideoByBandId(bandId);
			model.addAttribute("tags",tags);
			model.addAttribute("concertList", concertList);
			model.addAttribute("recentPostList",recentPostList);
			model.addAttribute("videoList", videoList);
		}
		model.addAttribute("bandInfo", bandInfo);
		return "band/blog";
	}
	
	@RequestMapping(value ="/{bandId}/post/{postId}", method = RequestMethod.GET)
	public String postPage(@ModelAttribute("command") Comment comment,@PathVariable("bandId") Long bandId, @PathVariable("postId") Long postId, Model model){
		BandInfo bandInfo = BandInfo.findBandInfo(bandId);
		if(bandInfo == null){
			
		}else{
			String category = bandInfo.getCategory();
			
			String[] tags = category.split(" ");
			model.addAttribute("tags",tags);
		}
		Post post = Post.findPostWithAuthorInfo(postId);
		model.addAttribute("post", post);
		model.addAttribute("commentList",post.getCommentList());
		model.addAttribute("bandInfo", bandInfo);
		return "band/post";
	}

	@PreAuthorize("hasRole('ROLE_USER') and hasPermission(#bandId, 'isBand')")
	@RequestMapping(value ="/{bandId}/post", method = RequestMethod.GET)
	public String addPost(@ModelAttribute("command") Post post, @PathVariable("bandId") Long bandId,Model model){
		BandInfo bandInfo = BandInfo.findBandInfo(bandId);
		model.addAttribute("bandInfo", bandInfo);
		if(bandInfo == null){
			
		}else{
			String category = bandInfo.getCategory();
			
			String[] tags = category.split(" ");
			model.addAttribute("tags",tags);
		}
		return "band/addPost";
	}
	
	@PreAuthorize("hasRole('ROLE_USER') and hasPermission(#bandId, 'isBand')")
	@RequestMapping(value ="/{bandId}/addYoutubeVideo", method = RequestMethod.POST)
	public void addYoutubeVideo(@ModelAttribute("command") Video video, @PathVariable("bandId") Long bandId,Model model){
		//System.out.println("video:"+video+",bandId:"+bandId);
		video.setBandInfo(BandInfo.findBandInfo(bandId));
		video.setType(Video.YOUTUBE_VIDEO);
		video.merge();
		model.addAttribute("command",video);
	}
	

	@PreAuthorize("hasRole('ROLE_USER') and hasPermission(#bandId, 'isBand')")
	@RequestMapping(value ="/{bandId}/post", method = RequestMethod.POST)
	public String addPost(@ModelAttribute("command") Post post, @PathVariable("bandId") Long bandId){
		UserInfo userInfo = authService.getUserInfo();
		post.setDate(Calendar.getInstance());
		post.setBandInfo(BandInfo.findBandInfo(bandId));
		post.setCommentCount(0);
		post.setUserInfo(userInfo);
		if(post.getContent() !=null){
			if(post.getContent().length() >= 200){
				post.setSummary(post.getContent().substring(0, 199)+"...");
			}else{
				post.setSummary(post.getContent());
			}
		}
		
		post.merge();
		return "redirect:/band/"+bandId;
		
	}

	@PreAuthorize("hasRole('ROLE_USER') and hasPermission(#postId, 'isBandPost')")
	@RequestMapping(value ="/{bandId}/post/{postId}/form", method = RequestMethod.GET)
	public String editPost( @PathVariable("bandId") Long bandId,  @PathVariable("postId") Long postId, Model model){
		BandInfo bandInfo = BandInfo.findBandInfo(bandId);
		Post post = Post.findPost(postId);
		model.addAttribute("postedit", post);
		model.addAttribute("bandInfo", bandInfo);
		
		if(bandInfo == null){
			
		}else{
			String category = bandInfo.getCategory();
			
			String[] tags = category.split(" ");
			model.addAttribute("tags",tags);
		}
		return "band/editPost";
	}

	@PreAuthorize("hasRole('ROLE_USER') and hasPermission(#postId, 'isBandPost')")
	@RequestMapping(value ="/{bandId}/post/{postId}", method = RequestMethod.PUT)
	public String updatePost(@ModelAttribute("postedit") Post post, @PathVariable("bandId") Long bandId, @PathVariable("postId") Long postId, SessionStatus sessionStatus){
		sessionStatus.setComplete();
		
		if(post.getContent() !=null){
			if(post.getContent().length() >= 200){
				post.setSummary(post.getContent().substring(0, 199)+"...");
			}else{
				post.setSummary(post.getContent());
			}
		}
		
		post.merge();
		return "redirect:/band/"+bandId+"/post/"+postId;
		
	}

	@PreAuthorize("hasRole('ROLE_USER') and hasPermission(#postId, 'isBandPost')")
	@RequestMapping(value ="/{bandId}/post/{postId}", method = RequestMethod.DELETE)
	public void delPost(@PathVariable("bandId") Long bandId, @PathVariable("postId") Long postId){
		Post post = Post.findPost(postId);
		
		post.delAllCommentList();
		post.remove();
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/create" , method = RequestMethod.GET)
	public void create(@ModelAttribute("command") BandInfo bandInfo){
		
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("command") BandInfo bandInfo,BindingResult bindingResult, Model model) throws IOException{
		if (!bindingResult.hasFieldErrors("profilePhoto") && (bandInfo.getProfilePhoto() == null || bandInfo.getProfilePhoto().getSize() == 0 || !imageService.isImageFile(bandInfo.getProfilePhoto()))) {
			bindingResult.rejectValue("profilePhoto", "NotImage.profilePhoto");
		}
		if (bindingResult.hasErrors()) {
			return "band/create";
		} else {
			UserInfo userInfo = authService.getUserInfo();
			bandService.generateNewBand(userInfo, bandInfo);
			return "redirect:/band/"+bandInfo.getId();
		}
	}
	

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{bandId}/post/{postId}/reply", method = RequestMethod.POST)
	public void postReply(@ModelAttribute("comment") Comment comment,@PathVariable("postId") Long postId,BindingResult bindingResult,Model model) throws JsonGenerationException, JsonMappingException, IOException{
		comment.setDate(Calendar.getInstance());
		
		comment.setPost(Post.findPost(postId));
		UserInfo userInfo = authService.getUserInfo();
		if(userInfo == null) model.addAttribute("command",null);
		else{
			comment.setUserInfo(userInfo);
			Comment result = comment.merge();
			if(result != null){
				Post post = Post.findPost(postId);
				post.setCommentCount(post.getCommentCount()+1);
				post.setId(postId);
				
				post.merge();
			}
			model.addAttribute("command",result);
		}
	}

	@PreAuthorize("hasRole('ROLE_USER') and hasPermission(#commentId, 'isBandComment')")
	@RequestMapping(value ="/{bandId}/post/{postId}/reply/{commentId}", method = RequestMethod.PUT)
	public void updateComment(String commentContent, @PathVariable("bandId") Long bandId, @PathVariable("postId") Long postId, @PathVariable("commentId") Long commentId){
		
		Comment comment = Comment.findComment(commentId);
		
		comment.setContent(commentContent);
		
		comment.merge();
		
	}

	@PreAuthorize("hasRole('ROLE_USER') and hasPermission(#commentId, 'isBandComment')")
	@RequestMapping(value = "/{bandId}/post/{postId}/reply/{commentId}", method = RequestMethod.DELETE)
	public void delReply(@PathVariable("bandId") Long bandId, @PathVariable("postId") Long postId, @PathVariable("commentId") Long commentId, Model model) throws JsonGenerationException, JsonMappingException, IOException{
		Comment comment = Comment.findComment(commentId);
		comment.remove();
		
		model.addAttribute("command", "OK");
	}
}
