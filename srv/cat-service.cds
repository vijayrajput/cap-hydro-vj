using my.bookshop as my from '../db/data-model';

@path : 'bookservice'
@protocol : 'rest'
@(requires: 'book-admin')
service CatalogService
{
    entity Authors as
        projection on my.Authors ;

    entity Books as
        projection on my.Books
        {
            *,
            author.name as authorName,
            stock as availiableStock
        }
        excluding
        {
            createdBy,
            modifiedBy,
            stock
        };
}
