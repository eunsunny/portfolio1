package com.green.sunny.adminUtils;

/*
 * ���� �������� ������ ������ ���� 
 * - ���������� ��ȣ
 * - ������ �� ��� �׸� �� 
 * - �� ���������� �����ϴ� �׸� ��ȣ 
 */
public class Criteria {
	private int pageNum;	 	//���� ������ ��ȣ 
	private int rowsPerPage;	//�������� ������� ���� 
	
	// ������
	public Criteria() {
		this(1, 10);	//�⺻��: 1������, �׸��:10��
	}
	
	public Criteria(int pageNum, int rowsPerPage) {
		this.pageNum = pageNum;
		this.rowsPerPage = rowsPerPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if (pageNum <= 0)
			this.pageNum = 1;
		else
			this.pageNum = pageNum;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}
	
	// �������� �׸� ���� �ִ� 10���� ���� 
	public void setRowsPerPage(int rowsPerPage) {
		if (rowsPerPage <=0 || rowsPerPage > 10)
			this.rowsPerPage = 10;
		else
			this.rowsPerPage = rowsPerPage;
	}
	/*
	 * �� ���������� �����ϴ� �׸� ��ȣ�� ��ȯ
	 */
	public int getPageStart() {
		// 2������ 		1 *  10 +1 = 11
		return (pageNum-1) * rowsPerPage + 1;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", rowsPerPage=" + rowsPerPage + "]";
	}
	
	

}
