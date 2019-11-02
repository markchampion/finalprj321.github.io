package com.mark.drive;

import java.*;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
import com.google.api.services.drive.model.Permission;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DriveQuickstart {

    private static final String APPLICATION_NAME = "Google Drive API Java Quickstart";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private static final String TOKENS_DIRECTORY_PATH = "tokens";

    /**
     * Global instance of the scopes required by this quickstart. If modifying
     * these scopes, delete your previously saved tokens/ folder.
     */
    private static final List<String> SCOPES = Collections.singletonList(DriveScopes.DRIVE);
    private static final String CREDENTIALS_FILE_PATH = "../resources/credentials.json";

    /**
     * Creates an authorized Credential object.
     *
     * @param HTTP_TRANSPORT The network HTTP Transport.
     * @return An authorized Credential object.
     * @throws IOException If the credentials.json file cannot be found.
     */
    private static Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) throws IOException {
        // Load client secrets.
        InputStream in = DriveQuickstart.class.getResourceAsStream(CREDENTIALS_FILE_PATH);
        if (in == null) {
            throw new FileNotFoundException("Resource not found: " + CREDENTIALS_FILE_PATH);
        }
        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(new FileDataStoreFactory(new java.io.File(TOKENS_DIRECTORY_PATH)))
                .setAccessType("offline")
                .build();
        LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(8888).build();
        return new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
    }

    /**
     * Insert a new permission.
     *
     * @param fileName
     * @param filePath
     * @return The inserted permission if successful, {@code null} otherwise.
     * @throws java.io.IOException
     * @throws java.security.GeneralSecurityException
     */
    public static File uploadMp3(String fileName, java.io.File filePath) throws IOException, GeneralSecurityException {
        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        Drive service = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        // First retrieve the permission from the API.
        Permission permission = new Permission()
                .setType("anyone")
                .setRole("writer");
        File fileMetadata = new File();
        fileMetadata.setName(fileName);
        FileContent fileContent = new FileContent("audio/MP3", filePath);
        File file = service.files().create(fileMetadata, fileContent)
                .setFields("id")
                .execute();
        service.permissions().create(file.getId(), permission).execute();
        return file;

    }

    public static File uploadImage(String fileName, java.io.File filePath) throws Exception {
        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        Drive service = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        Permission permission = new Permission()
                .setType("anyone")
                .setRole("writer");
        File fileMetadata = new File();
        fileMetadata.setName(fileName);
        FileContent fileContent = new FileContent("image/jpeg", filePath);
        File file = service.files().create(fileMetadata, fileContent)
                .setFields("id")
                .execute();
        service.permissions().create(file.getId(), permission).execute();
        return file;

    }

    private static void deleteFile(String fileId) throws Exception {
        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        Drive service = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        try {
            service.files().delete(fileId).execute();
        } catch (IOException e) {
            System.out.println("An error occurred: " + e);
        }
    }

    public static File updateImage(String linkFile, String fileName, java.io.File filePath) {
        try {
            final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            Drive service = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                    .setApplicationName(APPLICATION_NAME)
                    .build();
            FileContent mediaContent = new FileContent("image/jpeg", filePath);
            File fileMetaData = new File();
            fileMetaData.setName(fileName);
            return service.files().update(linkFile.split("id=")[1], fileMetaData, mediaContent).execute();
        } catch (GeneralSecurityException ex) {
            Logger.getLogger(DriveQuickstart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DriveQuickstart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void updateMp3(String linkFile, String fileName, java.io.File filePath) {
        try {
            final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            Drive service = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                    .setApplicationName(APPLICATION_NAME)
                    .build();
            FileContent mediaContent = new FileContent("audio/MP3", filePath);
            File fileMetaData = new File();
            fileMetaData.setName(fileName);
//        System.out.println(service.permissions().create("1kQspptGgrpxB0_AA4p1mlimB2SGnRvgK", permission).execute() == null);
            File updateFile = service.files().update(linkFile.split("id=")[1], fileMetaData, mediaContent).execute();
        } catch (GeneralSecurityException ex) {
            Logger.getLogger(DriveQuickstart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DriveQuickstart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String... args) throws IOException, GeneralSecurityException {
        // Build a new authorized API client service.
        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        Drive service = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        // Print the names and IDs for up to 10 files.
        //UPDATE
        Permission permission = new Permission()
                .setType("anyone")
                .setRole("writer");
//        File oldFile = service.files().get("1kQspptGgrpxB0_AA4p1mlimB2SGnRvgK").execute();
//        System.out.println(oldFile);
        java.io.File fileContent = new java.io.File("D:\\ProjectWeb_Source\\noinaycoanh.jpg");
        FileContent mediaContent = new FileContent("image/jpeg", fileContent);
        File fileMetaData = new File();
        fileMetaData.setName("noinaycoanh");
//        System.out.println(service.permissions().create("1kQspptGgrpxB0_AA4p1mlimB2SGnRvgK", permission).execute() == null);
        File updateFile = service.files().update("1kQspptGgrpxB0_AA4p1mlimB2SGnRvgK", fileMetaData, mediaContent).execute();

        //GET FILE
//        FileList result = service.files().list()
//                .setPageSize(10)
//                .setFields("nextPageToken, files(id, name, webContentLink, webViewLink)")
//                .execute();
//        Permission permission = new Permission()
//                .setType("anyone")
//                .setRole("writer");
//        List<File> files = result.getFiles();
//        if (files == null || files.isEmpty()) {
//            System.out.println("No files found.");
//        } else {
//            System.out.println("Files:");
//            for (File file : files) {
//                System.out.println(service.permissions().create(file.getId(), permission).execute() == null);
//                System.out.printf("%s (%s)\n", file.getName(), file.getWebContentLink());
//            }
//        }
        //WORKED
        //---------
//        File fileMetadata = new File();
//
//        fileMetadata.setName("HAHAHAHA");
//        fileMetadata.setMimeType("application/vnd.google-apps.folder");
//        File file = service.files().create(fileMetadata).setFields("id, name").execute();
//        System.out.println(file.getWebViewLink());
    }
}
