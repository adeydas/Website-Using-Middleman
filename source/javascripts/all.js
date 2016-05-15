function gen_mail_to_link(lhs,rhs) {
    document.write("<a href=\"mailto");
    document.write(":" + lhs + "@");
    document.write(rhs + "\">" + lhs + "@" + rhs + "<\/a>");
}