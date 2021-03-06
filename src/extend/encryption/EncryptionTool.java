package extend.encryption;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class EncryptionTool {
	
	 public static String md5(String info) {
	     try {
	            //获取 MessageDigest 对象，参数为 MD5 字符串，表示这是一个 MD5 算法（其他还有 SHA1 算法等）：
	        MessageDigest md5 = MessageDigest.getInstance("MD5");
	        //update(byte[])方法，输入原数据
	        //类似StringBuilder对象的append()方法，追加模式，属于一个累计更改的过程
	        md5.update(info.getBytes("UTF-8"));
	        //digest()被调用后,MessageDigest对象就被重置，即不能连续再次调用该方法计算原数据的MD5值。可以手动调用reset()方法重置输入源。
	        //digest()返回值16位长度的哈希值，由byte[]承接
	        byte[] md5Array = md5.digest();
	        //byte[]通常我们会转化为十六进制的32位长度的字符串来使用,本文会介绍三种常用的转换方法
	        return bytesToHex1(md5Array);
	    } catch (NoSuchAlgorithmException e) {
	        return "";
	    } catch (UnsupportedEncodingException e) {
	    	return "";
        }
	}
	 
	private static String bytesToHex1(byte[] md5Array) {
	    StringBuilder strBuilder = new StringBuilder();
	    for (int i = 0; i < md5Array.length; i++) {
	        int temp = 0xff & md5Array[i];//TODO:此处为什么添加 0xff & ？
	        String hexString = Integer.toHexString(temp);
	        if (hexString.length() == 1) {//如果是十六进制的0f，默认只显示f，此时要补上0
	            strBuilder.append("0").append(hexString);
	        } else {
	            strBuilder.append(hexString);
	        }
	    }
	    return strBuilder.toString();
	}
	
	/**
	 * 生成唯一订单号
	 * @return
	 */
	public static String outTradeNo() {
        int machineId = 1;//最大支持1-9个集群机器部署
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if(hashCodeV < 0) {//有可能是负数
            hashCodeV = - hashCodeV;
        }
//         0 代表前面补充0     
//         4 代表长度为4     
//         d 代表参数为正数型
        return  machineId+ String.format("%015d", hashCodeV);
    }
}
