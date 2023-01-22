export interface InvoiceInterface {
    id: number;
    billed: Date;
    trip_id: number;
    status: string;
    amount: number;
    payed: Date;
    fee: number;
}
