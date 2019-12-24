package pojo;

public class Town {
    private Integer id;

    private Integer cid;

    private String simText;

    private String detText;

    private String name;

   TowImage image;

    public void setImage(TowImage image) {
        this.image = image;
    }

    public TowImage getImage() {
        return image;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getSimText() {
        return simText;
    }

    public void setSimText(String simText) {
        this.simText = simText == null ? null : simText.trim();
    }

    public String getDetText() {
        return detText;
    }

    public void setDetText(String detText) {
        this.detText = detText == null ? null : detText.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}