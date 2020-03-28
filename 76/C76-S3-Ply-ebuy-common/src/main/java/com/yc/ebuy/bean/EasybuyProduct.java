package com.yc.ebuy.bean;

public class EasybuyProduct {
    private Integer id;

    private String name;

    private String description;

    private Float price;

    private Integer stock;

    private Integer categorylevel1id;

    private Integer categorylevel2id;

    private Integer categorylevel3id;

    private String filename;

    private Integer isdelete;
    
    private EasybuyProductCategory category1;
    private EasybuyProductCategory category2;
    private EasybuyProductCategory category3;
    
    public EasybuyProductCategory getCategory1() {
		return category1;
	}

	public void setCategory1(EasybuyProductCategory category1) {
		this.category1 = category1;
	}

	public EasybuyProductCategory getCategory2() {
		return category2;
	}

	public void setCategory2(EasybuyProductCategory category2) {
		this.category2 = category2;
	}

	public EasybuyProductCategory getCategory3() {
		return category3;
	}

	public void setCategory3(EasybuyProductCategory category3) {
		this.category3 = category3;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getCategorylevel1id() {
        return categorylevel1id;
    }

    public void setCategorylevel1id(Integer categorylevel1id) {
        this.categorylevel1id = categorylevel1id;
    }

    public Integer getCategorylevel2id() {
        return categorylevel2id;
    }

    public void setCategorylevel2id(Integer categorylevel2id) {
        this.categorylevel2id = categorylevel2id;
    }

    public Integer getCategorylevel3id() {
        return categorylevel3id;
    }

    public void setCategorylevel3id(Integer categorylevel3id) {
        this.categorylevel3id = categorylevel3id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public Integer getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Integer isdelete) {
        this.isdelete = isdelete;
    }
}