package com.EIE.demo.dataService;


import com.EIE.demo.dao.IncrementationFichierRepository;
import com.EIE.demo.exception.FileStorageException;
import com.EIE.demo.exception.MyFileNotFoundException;
import com.EIE.demo.model.IncrementationFichier;
import com.EIE.demo.property.FileStorageProperties;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Random;

@Service
public class FileStorageService {

    private final Path fileStorageLocation;

    @Autowired
    IncrementationFichierRepository incrementationFichierRepository;

    @Autowired
    public FileStorageService(FileStorageProperties fileStorageProperties) throws IOException, URISyntaxException {
//    	URI chemain = new ClassPathResource("/static/assets/myFile").getURI();

        this.fileStorageLocation = Paths.get(fileStorageProperties.getUploadDir())
                .toAbsolutePath().normalize();
       
        try {
            Files.createDirectories(this.fileStorageLocation);
        } catch (Exception ex) {
            throw new FileStorageException("Could not create the directory where the uploaded files will be stored.", ex);
        }
    }

    public String storeFile(MultipartFile file) {
        // Normalize file name
        String NomFichier = StringUtils.cleanPath(file.getOriginalFilename());
        String exe = FilenameUtils.getExtension(NomFichier);
        String fileName = FilenameUtils.removeExtension(NomFichier);
        IncrementationFichier incr = new IncrementationFichier();
        incrementationFichierRepository.save(incr);
        String formatValue = String.format("%04d", incr.getId_code());


        try {
            /*// Check if the file's name contains invalid characters
            if(NomFichier.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " +fileName+formatValue+exe);
            }
*/
            // Copy file to the target location (Replacing existing file with the same name)
            Path targetLocation = this.fileStorageLocation.resolve("file"+formatValue+"."+exe);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return "file"+formatValue+"."+exe;
        } catch (IOException ex) {
            throw new FileStorageException("Could not store file " + fileName + ". Please try again!", ex);
        }
    }

    public Resource loadFileAsResource(String fileName) {
        try {
            Path filePath = this.fileStorageLocation.resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            if(resource.exists()) {
                return resource;
            } else {
                throw new MyFileNotFoundException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new MyFileNotFoundException("File not found " + fileName, ex);
        }
    }
}
