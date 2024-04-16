package com.ndc.laptopvn.domain.request;

public class SearchProductRequest {
    private String keyword;
    private int page;
    private int size;

    public SearchProductRequest() {
    }

    public SearchProductRequest(String keyword, int page, int size) {
        this.keyword = keyword;
        this.page = page;
        this.size = size;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}