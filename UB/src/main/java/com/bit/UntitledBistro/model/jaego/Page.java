package com.bit.UntitledBistro.model.jaego;

public class Page {
	  private int startRow, endRow, pageNum;
	  private StringBuffer sb;
	   
	  public synchronized void paging(int totalCount, int pageSize, int pageBlock) {
	    if(pageNum == 0 ) pageNum = 1;
		int totalPage = (int)Math.ceil((double)totalCount/pageSize);
	    startRow = (pageNum - 1) * pageSize + 1;
	    endRow = pageNum * pageSize;
	     
	    int startPage = (int)((pageNum - 1)/pageBlock) * pageBlock + 1;
	    int endPage = startPage + pageBlock - 1;
	     
	    if(endPage > totalPage) {
	      endPage = totalPage;
	    }
	     
	    sb = new StringBuffer();
	     
	    // Page클래스 변경 부분
	    if(startPage < pageBlock) {
	      sb.append("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	    } else {
	      sb.append("<li class=''><a href='javascript:dataLoad(");
	      sb.append(startPage - pageBlock);
	      sb.append(")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	    }
	     
	    for(int i = startPage; i <= endPage; i++) {
	      if(i == pageNum) {
	        sb.append("<li class='active'><a href='#'>");
	        sb.append(i);
	        sb.append("<span class='sr-only'>");
	        sb.append(i);
	        sb.append("</span></a></li>");
	      } else {
	        sb.append("<li class=''><a href='javascript:dataLoad(");
	        sb.append(i);
	        sb.append(")'>");
	        sb.append(i);
	        sb.append("<span class='sr-only'>");
	        sb.append(i);
	        sb.append("</span></a></li>");
	      }
	    }
	     
	    if(endPage < totalPage) {
	      sb.append("<li class=''><a href='javascript:dataLoad(");
	      sb.append(startPage + pageBlock);
	      sb.append(")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	    } else {
	      sb.append("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	    }
	  }
	   
	  public StringBuffer getSb() {
	    return sb;
	  }
	 
	  public int getStartRow() {
	    return startRow;
	  }
	 
	  public int getEndRow() {
	    return endRow;
	  }

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	  
	  
}


