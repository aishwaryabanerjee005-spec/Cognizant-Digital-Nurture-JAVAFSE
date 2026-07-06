public class SearchAlgorithms
{
    public static Product linearSearch(Product[] products, int id)
    {
        for(Product p : products)
        {
            if(p.productId == id)
                return p;
        }
        return null;
    }

    public static Product binarySearch(Product[] products, int id)
    {
        int low = 0;
        int high = products.length - 1;

        while(low <= high)
        {
            int mid = (low + high) / 2;

            if(products[mid].productId == id)
                return products[mid];

            else if(products[mid].productId < id)
                low = mid + 1;

            else
                high = mid - 1;
        }

        return null;
    }
}