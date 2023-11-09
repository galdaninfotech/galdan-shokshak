
import 'models/product_model.dart';


class ProductRepository {
  const ProductRepository();

  List<Product> getProducts() {
    // Future.delayed(const Duration(seconds: 2)).then((val) {
    //   // Your logic here 
    // });
    Future.delayed(Duration(seconds: 2));
    return products;
  }

  static List<Product> products = [
    Product(
      id: 1,
      sku: 'hgfdhg',
      name: 'Tsewang',
      description: 'description',
      urlKey: 'urlKey',
      baseImage: Image(
        largeImageUrl: 'Large',
        mediumImageUrl: 'medium',
        originalImageUrl: 'original',
        smallImageUrl: 'small'
      ),
      images: [
        Image(
          largeImageUrl: 'Large',
          mediumImageUrl: 'medium',
          originalImageUrl: 'original',
          smallImageUrl: 'small'
        ),
      ],
      isNew: true,
      isFeatured: true,
      onSale: true,
      isWishlist: true,
      minPrice: '100',
      prices: Prices(
        regular: Final(price: 100, formattedPrice: '100'), 
        pricesFinal: Final(price: 120, formattedPrice: '120'),
      ),
      priceHtml: 'priceHtml',
      avgRatings: 8,
    ),

    Product(
      id: 2,
      sku: 'hgfdhg',
      name: 'Admin',
      description: 'description',
      urlKey: 'urlKey',
      baseImage: Image(
        largeImageUrl: 'Large',
        mediumImageUrl: 'medium',
        originalImageUrl: 'original',
        smallImageUrl: 'small'
      ),
      images: [
        Image(
          largeImageUrl: 'Large',
          mediumImageUrl: 'medium',
          originalImageUrl: 'original',
          smallImageUrl: 'small'
        ),
      ],
      isNew: true,
      isFeatured: true,
      onSale: true,
      isWishlist: true,
      minPrice: '100',
      prices: Prices(
        regular: Final(price: 100, formattedPrice: '100'), 
        pricesFinal: Final(price: 120, formattedPrice: '120'),
      ),
      priceHtml: 'priceHtml',
      avgRatings: 10,
    ),
  ];
}
