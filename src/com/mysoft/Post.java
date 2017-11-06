package com.mysoft;

public class Post {
    int id;
    String str;

    public Post(int id, String str) {
        this.id = id;
        this.str = str;
    }

    public int getId(){
        return id;
    }
    public void setID(int id){
        this.id = id;
    }
    public String getStr(){
        return str;
    }
    public void setStr(String str){
        this.str = str;
    }
    public String toString(){
        return "Post{id="+id+", str='"+str+"'}";
    }
}
