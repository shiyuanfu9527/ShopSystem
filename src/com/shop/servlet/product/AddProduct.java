package com.shop.servlet.product;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shop.dao.ProductDao;
import com.shop.domain.Product;
import com.shop.utils.DBUtil;

public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddProduct() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{ 
			
	        request.setCharacterEncoding("utf-8");
	        response.setContentType("text/html,charset=utf-8");
 		PrintWriter out = response.getWriter();
//			String pName = request.getParameter("pName");
//			String pDesc = request.getParameter("pDesc");
//			
//			int pNum = Integer.parseInt(request.getParameter("pNum"));
//			
//			String  pubTime = (request.getParameter("pubTime"));
//			
//			int pKeepTime = Integer.parseInt(request.getParameter("pKeepTime"));
//			String pImage = request.getParameter("pImage");
//			
//		int kId = Integer.parseInt(request.getParameter("kId"));
 	
//			BigDecimal iPrice = new BigDecimal(Double.valueOf(request.getParameter("iPrice")));
//			BigDecimal mPrice = new BigDecimal(Double.valueOf(request.getParameter("mPrice")));
//			String isHot = request.getParameter("isHot");
//			String isShow = request.getParameter("isShow");
			 Map<String,String> map = new HashMap<String,String>();
			//??????????????????????????????  
	        DiskFileItemFactory factory = new DiskFileItemFactory();  
	        //????????????????????????  
	        ServletFileUpload sfu = new ServletFileUpload(factory);  
	        sfu.setHeaderEncoding("UTF-8");
	        String filename="";
	       
	        //????????????  
	        //????????????????????????
	        List<FileItem>list=sfu.parseRequest(request);
	        //????????????
	        for(FileItem fileItem : list) {
	        	//?????????????????????????????????????????????????????????
	        	if(fileItem.isFormField()) {
	        		//????????????
	        		String key=fileItem.getFieldName();
	        		String value = fileItem.getString("UTF-8");
	        		map.put(key, value);
	        		
	        	}else {
	        		//????????????m
	        		 filename= fileItem.getName();
	        		 if(filename==null||filename.trim().equals("")) {
	        			 continue;
	        		 }
	        		
	        	InputStream in =	fileItem.getInputStream();
	        	String path = getServletContext().getRealPath("/img");
	        	OutputStream os = new FileOutputStream(path+"/"+filename);
	        	int len = 0;
	        	byte[] b = new byte[1024];
	        	while((len = in.read(b))!=-1) {
	        		os.write(b,0,len);
	        	}
	        	in.close();
	        	os.close();
	        	}
	        }
	        Product product = new Product();
	        BeanUtils.populate(product, map);
	        product.setpImage("img/"+filename);
	      //  product.setkId(2);
	        
//			String sql = "insert into product(pName,pDesc,pNum,pubTime,pKeepTime,pImage,kId,iPrice,mPrice,isHot,isShow) values(?,?,?,?,?,?,?,?,?,?,?)";
//			Object[] params = {
//			    pName, 
//			    pDesc ,
//				pNum,
//				pubTime,
//				pKeepTime,
//				pImage,
//				kId,
//			    iPrice,
//				mPrice ,
//				isHot,
//				isShow
//			};
//			DBUtil db = new DBUtil();
			
//			int n = db.doUpdate(sql, params);
//			if(n > 0){
//				out.println("add Product sucess!");
//			}else {
//				out.println("add Product failed!");
//			}
			ProductDao dao = new ProductDao();
			dao.insert(product);
			out.print("sucess");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
}
