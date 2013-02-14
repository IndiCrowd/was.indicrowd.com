package com.indicrowd.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class FileService {
	
	@Value("#{userfileConfig.path}")
	private String basePath;

	/**
	 * 파일 전체 경로를 구함
	 */
	public String getFullPath(String fileName) {
		return getFullPath(fileName, false);
	}

	/**
	 * 파일 전체 경로를 구함
	 */
	public String getFullPath(String fileName, boolean useMkdirs) {

		if (useMkdirs) {
			File dir = new File(basePath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
		}
		return basePath + File.separatorChar + fileName;
	}

	/**
	 * 파일 저장
	 */
	public boolean save(File file, String fileName) throws IOException {
		return save(file, fileName, false);
	}

	/**
	 * 파일 저장
	 */
	public boolean save(File file, String fileName, boolean isOverride) throws IOException {

		if (file != null && !file.getName().equals("")) {
			FileInputStream fis = new FileInputStream(file);
			boolean isSaved = save(fis, fileName, isOverride);
			fis.close();

			return isSaved;
		} else {
			return false;
		}
	}
	
	/**
	 * 파일 저장
	 */
	public boolean save(CommonsMultipartFile file, String fileName) throws IOException {
		return save(file, fileName, false);
	}

	/**
	 * 파일 저장
	 */
	public boolean save(CommonsMultipartFile file, String fileName, boolean isOverride) throws IOException {

		if (file != null && !file.getName().equals("")) {
			return save(file.getInputStream(), fileName, isOverride);
		} else {
			return false;
		}
	}

	/**
	 * 파일 저장
	 */
	public boolean save(InputStream is, String fileName) throws IOException {
		return save(is, fileName, false);
	}

	/**
	 * 파일 저장
	 */
	public boolean save(InputStream is, String fileName, boolean isOverride) throws IOException {

		String fullPath = getFullPath(fileName, true);

		if (isOverride || !(new File(fullPath).exists())) {
			FileOutputStream fos = new FileOutputStream(fullPath);

			int bytesRead = 0;
			byte[] buffer = new byte[1024];
			while ((bytesRead = is.read(buffer, 0, 1024)) != -1) {
				fos.write(buffer, 0, bytesRead);
			}

			fos.close();

			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 파일 저장
	 */
	public boolean save(byte[] bytes, String fileName) throws IOException {
		return save(bytes, fileName, false);
	}

	/**
	 * 파일 저장
	 */
	public boolean save(byte[] bytes, String fileName, boolean isOverride) throws IOException {

		String fullPath = getFullPath(fileName, true);

		if (isOverride || !(new File(fullPath).exists())) {
			FileOutputStream fos = new FileOutputStream(fullPath);
			fos.write(bytes);
			fos.close();

			return true;
		} else {
			return false;
		}
	}

	/**
	 * 파일 로드
	 */
	public File load(String fileName) throws FileNotFoundException {
		return new File(getFullPath(fileName));
	}

	/**
	 * 파일명 수정
	 */
	public boolean rename(String originFileName, String fileName) throws IOException {

		String originFullPath = getFullPath(originFileName);
		File originFile = new File(originFullPath);

		String fullPath = getFullPath(fileName);
		File file = new File(fullPath);

		return originFile.renameTo(file);
	}

	/**
	 * 파일 삭제
	 */
	public boolean delete(String fileName) {

		String fullPath = getFullPath(fileName);

		File file = new File(fullPath);
		return file.delete();
	}

}
