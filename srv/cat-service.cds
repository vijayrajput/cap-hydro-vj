using my.bookshop as my from '../db/data-model';

@path : 'bookservice'
//@protocol : 'rest'
@requires : 'book-admin'
service CatalogService
{
    function health
    (
    )
    returns Boolean;

    entity Authors as
        projection on my.Authors;

    @odata.draft.enabled
    entity Books as
        projection on my.Books
        {
            *,
            author.name as authorName,
            stock as availiableStock
        }
        actions
        {
            function getStock
            (
            )
            returns Integer;
        };

    entity Suppliers as
        projection on my.Suppliers;
}
