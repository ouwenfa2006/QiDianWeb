package com.foshan.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
/**
 * 验证码控制器
 * @author Administrator
 *
 */
@Controller
public class ImageAction{
	private static final long serialVersionUID = 1L;
	private ByteArrayInputStream inputStream;
    private static int WIDTH = 80;
    private static int HEIGHT = 35;

    // struts param标签指定获取的内容
    public ByteArrayInputStream getInputStream(){
        return inputStream;
    }

    // 保存返回的输入流[对服务器来说是输出流,但对返回给浏览器是输入流]
    public void setInputStream(ByteArrayInputStream inputStream){
        this.inputStream = inputStream;
    }
    
    public String getFileName(){
    	return "imagecode.jpeg";
    }

    // 生成随机字符码
    private static String createRandom(){
        String str = "0123456789qwertyuiopasdfghjklzxcvbnm";
        char[] rands = new char[4];

        Random random = new Random();
        for (int i = 0; i < 4; i++){
            rands[i] = str.charAt(random.nextInt(str.length()));
        }
        return new String(rands);
    }

    // 创建模糊背景干扰点
    private void drawBackground(Graphics g){
        // 画背景
        g.setColor(new Color(0xDCDCDC));
        g.fillRect(0, 0, WIDTH, HEIGHT);

        // 随机产生 120个干扰点(椭圆)
        for (int i = 0; i < 120; i++){
        	
            int x = (int) (Math.random() * WIDTH);
            int y = (int) (Math.random() * HEIGHT);
            
            int red = (int) (Math.random() * 255);
            int green = (int) (Math.random() * 255);
            int blue = (int) (Math.random() * 255);
            
            g.setColor(new Color(red, green, blue));
            g.drawOval(x, y, 1, 0);
        }
    }

    // 绘制随机码
    private void drawRands(Graphics g, String rands){
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 20));

        // 在不同的高度上输出验证码的每个字符
        Graphics2D g2d = (Graphics2D) g;
        //g2d.rotate(0.1 * Math.PI);//旋转
        g2d.drawString("" + rands.charAt(0), 5, 20);
        g2d.drawString("" + rands.charAt(1), 25, 20);
        g2d.drawString("" + rands.charAt(2), 45, 20);
        g2d.drawString("" + rands.charAt(3), 65, 20);
        //System.out.println(rands);
    }
    public String execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
    	
     // HttpServletResponse response = request.getServletContext().getRealPath(path)
    	
        // 设置浏览器不要缓存此图片
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // 生成图片缓存
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();

        // 产生图像
        drawBackground(g);
        // 创建随机码
        String rands = createRandom();
        // 在背景图中绘制随机码
        drawRands(g, rands);
        // 结束图像 的绘制 过程， 完成图像
        g.dispose();

        // 图片写出到字节输出流中
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(image, "jpeg", outputStream);

        ByteArrayInputStream input = new ByteArrayInputStream(outputStream.toByteArray());
        this.setInputStream(input);

        // 将随机码写入到session中
        HttpSession session = request.getSession();
        session.setAttribute("checkCode", rands);
        
        input.close();        
        outputStream.close();

        return "success";
    }
}
