$version: "2"

namespace com.gatcg.cards

use com.gatcg#StringList

structure Card {
    uuid: String,
    classes: StringList,
    subtypes: StringList,
    cost_memory: Integer,
    cost_reserve: Integer,
    // durability: String, // FIX
    // editions: String, // FIX
    effect: String,
    effect_raw: String,
    element: String,
    flavor: String, 
    // level: String, // FIX
    life: Integer,
    name: String,
    power: Integer,
    // related_ids: String, // FIX
    // result_editions: String, // FIX
    // rule: String, // FIX
    // slug: String, // FIX
    // speed: String, // FIX
    types: StringList,
}

list Cards {
    member: Card
}

resource CardsResource {
    identifiers: { slug: Slug },
    read: GetCard,
    list: ListCards,
}

@pattern("^[A-Za-z0-9 ]+$")
string Slug

@readonly
@http(method: "GET", uri: "/cards/autocomplete")
operation ListCards {
    input := for CardsResource {
        @required
        @httpQuery("name")
        name: Slug
    }

    // Smithy wants everything to be a unique Structure, so from what I can tell
    // it may be impossible to return a flat list of Cards as a response.. we may
    // have to do some trickery in the client to avoid this scenario. 
    // To be fair to smithy, this is a backwards implementation. 
    // Ideally Weebs of the Shore would use Smithy for modeling their API and then
    // we would just use *their* generated clients. One could argue that a flat list
    // as the main response in an API is a poor practice, because it stops you from
    // introducing additional properties outside of the Card scope without a breaking change.
    output := for CardsResource {
        _inner: Cards
    }
}

@readonly
@http(method: "GET", uri: "/cards/{slug}")
operation GetCard {
    input := for CardsResource {
        @required
        @httpLabel
        $slug
    }

    output := for CardsResource {
        uuid: String,
        classes: StringList,
        subtypes: StringList,
        cost_memory: Integer,
        cost_reserve: Integer,
        // durability: String, // FIX
        // editions: String, // FIX
        effect: String,
        effect_raw: String,
        element: String,
        flavor: String, 
        // level: String, // FIX
        life: Integer,
        name: String,
        power: Integer,
        // related_ids: String, // FIX
        // result_editions: String, // FIX
        // rule: String, // FIX
        // slug: String, // FIX
        // speed: String, // FIX
        types: StringList,
    }
}
