package book.model;

import java.util.Date;

public class Book {

	private int book_id;
	private String book_title;
	private String author;
	private String publisher;
	private double price;
	private String image;
	private Date date;
	
	public Book(){}
	
	public Book(int book_id, String book_title, String author, String publisher, double price, String image,
			Date date) {
		super();
		this.book_id = book_id;
		this.book_title = book_title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.image = image;
		this.date = date;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
}
