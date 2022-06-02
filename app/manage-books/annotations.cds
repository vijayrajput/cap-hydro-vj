using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
    UI.LineItem : [
        
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Genre',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Supplier',
            Value : supplier_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Author Name',
            Value : authorName,
        },
    ]
);
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Genre',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Supplier ID',
                Value : supplier_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'availiableStock',
                Value : availiableStock,
            },
            {
                $Type : 'UI.DataField',
                Value : author_ID,
                Label : 'Author Name',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.Books with {
    supplier @Common.Text : {
            $value : supplier_ID,
            ![@UI.TextArrangement] : #TextSeparate,
        }
};
annotate service.Books with {
    author @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Authors',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : author_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Authors with {
    ID @Common.Text : name
};
annotate service.Books with {
    author @Common.Text : {
            $value : author.name,
            ![@UI.TextArrangement] : #TextFirst,
        }
};
