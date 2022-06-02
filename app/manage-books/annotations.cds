using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
    UI.LineItem : [
        
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Genre',
            Value : genre,
            ![@UI.Importance] : #Low,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Supplier',
            Value : supplier_ID,
            ![@UI.Importance] : #Medium,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Author Name',
            Value : authorName,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : availiableStock,
            Label : 'Availiable Stock',
            Criticality : criticality,
            CriticalityRepresentation : #WithIcon,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.getStock',
            Label : 'Check Stock',
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
                Label : 'Availiable Stock',
                Value : availiableStock,
                Criticality : criticality,
                CriticalityRepresentation : #WithIcon,
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
            Label : 'Book Information',
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
annotate service.Books with @(
    UI.SelectionFields : []
);
annotate service.Books with {
    title @Common.Label : 'title'
};
annotate service.Books with {
    availiableStock @Common.FieldControl : #Mandatory
};
annotate service.Books with {
    title @Common.FieldControl : #Mandatory
};
