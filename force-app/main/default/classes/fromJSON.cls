@isTest
public class fromJSON{
	public cls_invoiceList[] invoiceList;
	class cls_invoiceList {
		public Double totalPrice;	//5.5
		public String statementDate;	//2011-10-04T16:58:54.858Z
		public cls_lineItems[] lineItems;
		public Integer invoiceNumber;	//1
	}
	class cls_lineItems {
		public Integer UnitPrice;	//1
		public Integer Quantity;	//5
		public String ProductName;	//Pencil
	}
	public static fromJSON parse(String json){
		return (fromJSON) System.JSON.deserialize(json, fromJSON.class);
	}

	static @isTest void testParse() {
		String json=		'{"invoiceList":[{"totalPrice":5.5,"statementDate":"2011-10-04T16:58:54.858Z","lineItems":[{"UnitPrice":1.0,"Quantity":5.0,"ProductName":"Pencil"},{"UnitPrice":0.5,"Quantity":1.0,"ProductName":"Eraser"}],"invoiceNumber":1}'+
		',{"totalPrice":11.5,"statementDate":"2011-10-04T16:58:54.858Z","lineItems":[{"UnitPrice":6.0,"Quantity":1.0,"ProductName":"Notebook"},{"UnitPrice":2.5,"Quantity":1.0,"ProductName":"Ruler"},{"UnitPrice":1.5,"Quantity":2.0,"ProductName":"Pen"}],"invoiceNumber":2}]}'+
		'';
		fromJSON obj = parse(json);
		System.assert(obj != null);
	}
}