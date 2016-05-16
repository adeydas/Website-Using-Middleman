function gen_mail_to_link() {
	lhs='abhishek';
	rhs='abhis.ws';
    document.write("<a href=\"mailto");
    document.write(":" + lhs + "@");
    document.write(rhs + "\">" + lhs + "@" + rhs + "<\/a>");
}