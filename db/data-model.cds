namespace my.bookshop;

using { managed } from '@sap/cds/common';

entity Books : managed
{
    key ID : Integer;
    @cds.api.ignore
    author : Association to one Authors;
    title : String;
    stock : Integer;
    @assert.range
    genre : Genres;
}

entity Authors : managed
{
    key ID : Integer;
    books : Association to many Books on books.author = $self;
    name : String(100);
}

type Genres : String enum
{
    Comic;
    Autobiography;
    Friction;
}
