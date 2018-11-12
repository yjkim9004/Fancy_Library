package model;

import java.io.*;
import java.util.*;

public class Reservation implements Serializable {
	private String memberId;
	private String title;
	private Date date;

	public Reservation() {
	}

	public Reservation(String memberId, String title, Date date) {
		this.memberId = memberId;
		this.title = title;
		this.date = date;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
