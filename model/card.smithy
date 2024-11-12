$version: "2"

namespace com.gatcg.card

use com.gatcg#StringList

resource Card {
    identifiers: { slug: Slug },
    read: GetCard,
}

@pattern("^[A-Za-z0-9 ]+$")
string Slug

@readonly
@http(method: "GET", uri: "/cards/{slug}")
operation GetCard {
    input := for Card {
        @required
        @httpLabel
        $slug
    }

    output := for Card {
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
