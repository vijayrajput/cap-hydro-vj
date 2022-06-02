namespace my.bookshop;

using {managed} from '@sap/cds/common';
using API_BUSINESS_PARTNER as bupa from '../srv/external/API_BUSINESS_PARTNER.csn';

entity Books : managed {
    key ID       : UUID;
        author   : Association to one Authors;
                
        title    : String;
        stock    : Integer;
        genre    : Genres
                   @assert.range;
        supplier : Association to one Suppliers;
}

entity Authors : managed {
    key ID    : Integer;
        books : Association to many Books
                    on books.author = $self;
        name  : String(100);
}

@readonly
@cds.odata.valuelist
entity Suppliers as projection on bupa.A_Supplier {
    Supplier         as ID,
    SupplierFullName as Name
};

type Genres : String enum {
    Comic;
    Autobiography;
    Friction;
}
