// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    int id;
    String sku;
    String name;
    String description;
    String urlKey;
    Image baseImage;
    List<Image> images;
    bool isNew;
    bool isFeatured;
    bool onSale;
    bool isWishlist;
    String minPrice;
    Prices prices;
    String priceHtml;
    int avgRatings;

    Product({
        required this.id,
        required this.sku,
        required this.name,
        required this.description,
        required this.urlKey,
        required this.baseImage,
        required this.images,
        required this.isNew,
        required this.isFeatured,
        required this.onSale,
        required this.isWishlist,
        required this.minPrice,
        required this.prices,
        required this.priceHtml,
        required this.avgRatings,
    });

    Product copyWith({
        int? id,
        String? sku,
        String? name,
        String? description,
        String? urlKey,
        Image? baseImage,
        List<Image>? images,
        bool? isNew,
        bool? isFeatured,
        bool? onSale,
        bool? isWishlist,
        String? minPrice,
        Prices? prices,
        String? priceHtml,
        int? avgRatings,
    }) => 
        Product(
            id: id ?? this.id,
            sku: sku ?? this.sku,
            name: name ?? this.name,
            description: description ?? this.description,
            urlKey: urlKey ?? this.urlKey,
            baseImage: baseImage ?? this.baseImage,
            images: images ?? this.images,
            isNew: isNew ?? this.isNew,
            isFeatured: isFeatured ?? this.isFeatured,
            onSale: onSale ?? this.onSale,
            isWishlist: isWishlist ?? this.isWishlist,
            minPrice: minPrice ?? this.minPrice,
            prices: prices ?? this.prices,
            priceHtml: priceHtml ?? this.priceHtml,
            avgRatings: avgRatings ?? this.avgRatings,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        urlKey: json["url_key"],
        baseImage: Image.fromJson(json["base_image"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        isNew: json["is_new"],
        isFeatured: json["is_featured"],
        onSale: json["on_sale"],
        isWishlist: json["is_wishlist"],
        minPrice: json["min_price"],
        prices: Prices.fromJson(json["prices"]),
        priceHtml: json["price_html"],
        avgRatings: json["avg_ratings"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "name": name,
        "description": description,
        "url_key": urlKey,
        "base_image": baseImage.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "is_new": isNew,
        "is_featured": isFeatured,
        "on_sale": onSale,
        "is_wishlist": isWishlist,
        "min_price": minPrice,
        "prices": prices.toJson(),
        "price_html": priceHtml,
        "avg_ratings": avgRatings,
    };
}

class Image {
    String smallImageUrl;
    String mediumImageUrl;
    String largeImageUrl;
    String originalImageUrl;

    Image({
        required this.smallImageUrl,
        required this.mediumImageUrl,
        required this.largeImageUrl,
        required this.originalImageUrl,
    });

    Image copyWith({
        String? smallImageUrl,
        String? mediumImageUrl,
        String? largeImageUrl,
        String? originalImageUrl,
    }) => 
        Image(
            smallImageUrl: smallImageUrl ?? this.smallImageUrl,
            mediumImageUrl: mediumImageUrl ?? this.mediumImageUrl,
            largeImageUrl: largeImageUrl ?? this.largeImageUrl,
            originalImageUrl: originalImageUrl ?? this.originalImageUrl,
        );

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        originalImageUrl: json["original_image_url"],
    );

    Map<String, dynamic> toJson() => {
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "original_image_url": originalImageUrl,
    };
}

class Prices {
    Final regular;
    Final pricesFinal;

    Prices({
        required this.regular,
        required this.pricesFinal,
    });

    Prices copyWith({
        Final? regular,
        Final? pricesFinal,
    }) => 
        Prices(
            regular: regular ?? this.regular,
            pricesFinal: pricesFinal ?? this.pricesFinal,
        );

    factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        regular: Final.fromJson(json["regular"]),
        pricesFinal: Final.fromJson(json["final"]),
    );

    Map<String, dynamic> toJson() => {
        "regular": regular.toJson(),
        "final": pricesFinal.toJson(),
    };
}

class Final {
    int price;
    String formattedPrice;

    Final({
        required this.price,
        required this.formattedPrice,
    });

    Final copyWith({
        int? price,
        String? formattedPrice,
    }) => 
        Final(
            price: price ?? this.price,
            formattedPrice: formattedPrice ?? this.formattedPrice,
        );

    factory Final.fromJson(Map<String, dynamic> json) => Final(
        price: json["price"],
        formattedPrice: json["formatted_price"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "formatted_price": formattedPrice,
    };
}
