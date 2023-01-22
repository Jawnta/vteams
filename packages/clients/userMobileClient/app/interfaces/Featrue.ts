export interface FeatureCollection {
    type: string;
    features: Feature[];
}

export interface Feature {
    type: string;
    properties: {
        id: string;
        city_id: string;
    };
    geometry: any;
}
