package com.indicrowd.file;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class ImageService {
	
	@Value("#{userfileConfig.thumbnailSize}")
	private int thumbnailSize;

	public boolean isImageFile(CommonsMultipartFile file) {
		String contentType = file.getContentType();
		switch (contentType) {
		case "image/jpeg":
		case "image/jpg":
		case "image/gif":
		case "image/png":
			return true;
		}
		return false;
	}
	
	public byte[] generateThumb(CommonsMultipartFile file) throws IOException {
		return generateThumb(file, thumbnailSize, 1);
	}
	
	public byte[] generateThumb(CommonsMultipartFile file, int maxWidth, double xyRatio) throws IOException {
		return generateThumb(getContent(file.getInputStream(), file.getSize()), maxWidth, xyRatio);
	}
	
	public byte[] generateThumb(File file) throws IOException {
		return generateThumb(file, thumbnailSize, 1);
	}

	public byte[] generateThumb(File file, int maxWidth, double xyRatio) throws IOException {
		return generateThumb(getContent(new FileInputStream(file), file.length()), maxWidth, xyRatio);
	}

	/**
	 * 섬네일 이미지 생성
	 */
	public byte[] generateThumb(byte[] imageContent, int maxWidth, double xyRatio) throws IOException {

		BufferedImage originalImg = ImageIO.read(new ByteArrayInputStream(imageContent));

		// get the center point for crop
		int[] centerPoint = { originalImg.getWidth() / 2, originalImg.getHeight() / 2 };

		// calculate crop area
		int cropWidth = originalImg.getWidth();
		int cropHeight = originalImg.getHeight();

		if (cropHeight > cropWidth * xyRatio) {
			// long image
			cropHeight = (int) (cropWidth * xyRatio);
		} else {
			// wide image
			cropWidth = (int) ((float) cropHeight / xyRatio);
		}

		// set target image size
		int targetWidth = cropWidth;
		int targetHeight = cropHeight;

		if (targetWidth > maxWidth) {
			// too big image
			targetWidth = maxWidth;
			targetHeight = (int) (targetWidth * xyRatio);
		}

		// processing image
		BufferedImage targetImage = new BufferedImage(targetWidth, targetHeight, BufferedImage.TYPE_INT_RGB);

		Graphics2D graphics2D = targetImage.createGraphics();
		graphics2D.setBackground(Color.WHITE);
		graphics2D.setPaint(Color.WHITE);
		graphics2D.fillRect(0, 0, targetWidth, targetHeight);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		graphics2D.drawImage(originalImg, 0, 0, targetWidth, targetHeight, centerPoint[0] - (int) (cropWidth / 2), centerPoint[1] - (int) (cropHeight / 2), centerPoint[0] + (int) (cropWidth / 2), centerPoint[1] + (int) (cropHeight / 2), null);

		ByteArrayOutputStream output = new ByteArrayOutputStream();

		ImageIO.write(targetImage, "png", output);

		return output.toByteArray();

	}

	// Returns the contents of the file in a byte array.
	private byte[] getContent(InputStream is, long length) throws IOException {

		// You cannot create an array using a long type.
		// It needs to be an int type.
		// Before converting to an int type, check
		// to ensure that file is not larger than Integer.MAX_VALUE.
		if (length > Integer.MAX_VALUE) {
			// File is too large
		}

		// Create the byte array to hold the data
		byte[] bytes = new byte[(int) length];

		// Read in the bytes
		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length && (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
			offset += numRead;
		}

		// Ensure all the bytes have been read in
		if (offset < bytes.length) {
			throw new IOException("Could not completely read file.");
		}

		// Close the input stream and return bytes
		is.close();
		return bytes;
	}
}
