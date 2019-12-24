package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;

import com.alibaba.fastjson.JSONObject;

/**
 * @ClassName: EntCoordSyncJob
 * @Description: TODO(这里用一句话描述这个类的作用)
 *
 */
public class MapUtil {
    private String jin;
    private  String wei;
    static String AK = "dbktO1jps7wrqQQITKADv8i7efY5ApaP"; // 百度地图密钥

    public static void main(String[] args) {
        String dom = "北京王府井";
        String coordinate = getCoordinate(dom);
        System.out.println("'" + dom + "'的经纬度为：" + coordinate);
        // System.err.println("######同步坐标已达到日配额6000限制，请明天再试！#####");
    }

    // 调用百度地图API根据地址，获取坐标
    public static String getCoordinate(String address) {
        if( address.equals("兴坪小镇"))
        {
            address="兴坪古镇";
        }
        if( address.equals("三花小镇"))
        {
            address="溶江镇";
        }
        if (address != null && !"".equals(address)) {
            address = address.replaceAll("\\s*", "").replace("#", "栋");
            String url = "http://api.map.baidu.com/geocoding/v3/?address=桂林市" + address + "&output=json&ak=" + AK;
            String json = loadJSON(url);
            if (json != null && !"".equals(json)) {
                JSONObject obj = JSONObject.parseObject(json);
                if ("0".equals(obj.getString("status"))) {
                    double lng = obj.getJSONObject("result").getJSONObject("location").getDouble("lng"); // 经度
                    double lat = obj.getJSONObject("result").getJSONObject("location").getDouble("lat"); // 纬度
                    DecimalFormat df = new DecimalFormat("#.######");
                    return df.format(lng) + "," + df.format(lat);
                }
            }
        }
        return null;
    }

    public static String loadJSON(String url) {
        StringBuilder json = new StringBuilder();
        try {
            URL oracle = new URL(url);
            URLConnection yc = oracle.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream(), "UTF-8"));
            String inputLine = null;
            while ((inputLine = in.readLine()) != null) {
                json.append(inputLine);
            }
            in.close();
        } catch (MalformedURLException e) {} catch (IOException e) {}
        return json.toString();
    }

    public String getWei() {
        return wei;
    }

    public void setWei(String wei) {
        this.wei = wei;
    }

    public String getJin() {
        return jin;
    }

    public void setJin(String jin) {
        this.jin = jin;
    }

    // 来自stackoverflow的MD5计算方法，调用了MessageDigest库函数，并把byte数组结果转换成16进制
    /*
     * public String MD5(String md5) { try { java.security.MessageDigest md = java.security.MessageDigest .getInstance("MD5"); byte[] array = md.digest(md5.getBytes()); StringBuffer sb = new StringBuffer(); for (int i = 0; i < array.length; ++i) { sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100) .substring(1, 3)); } return sb.toString(); } catch (java.security.NoSuchAlgorithmException e) {
     * } return null; }
     */
}