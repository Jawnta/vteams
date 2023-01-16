export interface OpenRouteServiceResponse {
    type: string;
    features: [
        {
            bbox: Array<number>;
            type: string;
            properties: {
                segments: [{
                    distance: number;
                    duration: number;
                    steps: Array<Step>;
                }],
                summary: {
                    distance: number;
                    duration: number;
                },
                way_points: Array<number>;
            },
            geometry: {
                coordinates: Array<Array<number>>;
                type: string;
            }
        }
    ],
    bbox: Array<number>;
    metadata: {
        attribution: string;
        service: string;
        timestamp: number;
        query: {
            coordinates: Array<Array<number>>;
            profile: string;
            format: string;
        },
        engine: {
            version: string;
            build_date: string;
            graph_date: string;
        }
    }
}

interface Step {
    distance: number;
    duration: number;
    type: number;
    instruction: string;
    name: string;
    way_points: Array<number>;
}
