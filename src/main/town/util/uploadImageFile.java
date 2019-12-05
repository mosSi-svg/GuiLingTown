package util;
import org.springframework.web.multipart.MultipartFile;

public class uploadImageFile {

    MultipartFile  image;

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

}