package com.indicrowd.tag;

import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import org.springframework.stereotype.Service;

@Service
public class TagService {
	
	private static final Pattern blankPattern = Pattern.compile("[ ][ ]+");

	public Set<Tag> inputTags(String tagInputsStr) {

		Set<Tag> tags = new HashSet<Tag>();

		if (tagInputsStr != null && !tagInputsStr.equals("")) {
			StringTokenizer st = new StringTokenizer(tagInputsStr, ",");
			while (st.hasMoreElements()) {
				tags.add(inputTag(st.nextToken()));
			}
		}

		return tags;
	}

	public Tag inputTag(String tagInputStr) /*throws TagException*/ {
		
		tagInputStr = cleanUpTagInputStr(tagInputStr);
		
		if (tagInputStr == null || tagInputStr.equals("") || tagInputStr.length() <= 0) {
			return null;
		}
		
		/*if (!tagInputStr.equals(cleanUpTagInputStr(tagInputStr))) {
			// Clean Up 된 태그 입력이 아닐 경우 예외
			throw new TagException("Clean Up 되지 않은 태그 입력입니다.");
		}*/
		
		// 이하 태그 입력 정보
		TagInput tagInput = TagInput.findTagInput(tagInputStr);
		
		if (tagInput == null) {
			tagInput = new TagInput();
			tagInput.setTagInputStr(tagInputStr);
			tagInput.increasePoint();
		}
		
		String tagStr = getProperTagStr(tagInputStr);
		
		// 이하 태그 정보
		Tag tag = Tag.findTag(tagStr);
		if (tag == null) {
			tag = new Tag();
			tag.setTagStr(tagStr);
			tag.setRepTagInput(tagInput);
			tag.increasePoint();
			
			tagInput.setTag(tag);
			tag.persist();
		} else if (tag.getRepTagInput() == null || tagInput.getPoint() >= tag.getRepTagInput().getPoint()) {
			tag.setRepTagInput(tagInput);
			
			tagInput.setTag(tag);
			tag.merge();
		}
		
		return tag;
	}
	
	public Tag getTag(String tagStr) /*throws TagException*/ {
		
		tagStr = getProperTagStr(tagStr);
		
		/*if (!tagStr.equals(getProperTagStr(tagStr))) {
			// 고유 태그가 아닐 경우 예외
			throw new TagException("고유 태그가 아닙니다.");
		}*/
		return Tag.findTag(tagStr);
	}

	public String cleanUpTagInputStr(String tagInputStr) {
		
		if (tagInputStr == null || tagInputStr.equals("") || tagInputStr.length() <= 0) {
			return null;
		}

		// 앞 뒤의 공백 제거
		tagInputStr = tagInputStr.trim();

		// 중복 공백 축소 (정규 표현식으로 처리)
		Matcher blankMatcher = blankPattern.matcher(tagInputStr);

		StringBuffer sb = new StringBuffer();
		while (blankMatcher.find()) {
			blankMatcher.appendReplacement(sb, " ");
		}
		blankMatcher.appendTail(sb);

		return sb.toString();
	}

	public String getProperTagStr(String tagInputStr) {
		String tagStr = new String(tagInputStr.trim());
		tagStr = tagStr.replaceAll(" ", ""); // 전체 공백 제거
		tagStr = tagStr.toLowerCase(); // 영어는 소문자로
		return tagStr;
	}
	
}
