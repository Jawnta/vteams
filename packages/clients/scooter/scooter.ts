export default class Scooter {
    protected id: number;
    protected enabled: boolean;
    protected available: boolean;
    protected inMaintenance: boolean;
    protected position: string; //change this to array?
    protected speed: number;
    protected charge: number;
/*    protected currentUser: number | null;*/

    constructor(id: number, enabled: boolean,
                available: boolean, inMaintenance: boolean,
                position: string, speed: number,
                charge: number)
    {
        this.id = id;
        this.enabled = enabled;
        this.available = available;
        this.inMaintenance = inMaintenance;
        this.position = position;
        this.speed = speed;
        this.charge = charge;
    }

    get(): object {
        return {
            id: this.getId(),
            enabled: this.getEnabled(),
            available: this.getAvailable(),
            inMaintenance: this.getInMaintenance(),
            position: this.getPosition(),
            speed: this.getSpeed(),
            charge: this.getCharge()
        }
    }

    getId(): number {
        return this.id;
    }

    setId(id: number) {
        this.id = id;
    }

    getEnabled(): boolean {
        return this.enabled;
    }

    setEnabled(enabled: boolean) {
        this.enabled = enabled;
    }

    getAvailable(): boolean {
        return this.enabled && this.available;
    }

    setAvailable(available: boolean) {
        this.available = available;
    }

    getInMaintenance(): boolean {
        return this.inMaintenance;
    }

    setInMaintenance(inMaintenance: boolean) {
        this.inMaintenance = inMaintenance;
    }

    getPosition(): string {
        return this.position;
    }

    setPosition(position: string) {
        this.position = position;
    }

    getSpeed(): number {
        return this.speed;
    }

    setSpeed(speed: number) {
        this.speed = speed;
    }

    getCharge(): number {
        return this.charge;
    }

    setCharge(charge: number) {
        this.charge = charge;
    }

    isRunning(): boolean {
        return this.getSpeed() > 0;
    }

    sendReport(): void {
        // SEND DATA TO API
        return;
    }

    assign(userId: number) {
        if (this.getAvailable()) {
            this.setAvailable(false);
            this.run();
            // return success
        }
        // return error
    }

    deallocate() {
        // if parking zone okay
        this.sleep();
    }

    run() {
        this.setCharge(this.getCharge() - 0.1);
        this.sendReport();
        setTimeout(() => this.run(), 2000);
    }

    sleep() {
        if (!this.isRunning()) {
            this.setCharge(this.getCharge() - 0.1);
            this.sendReport();
            setTimeout(() => this.sleep(), 60000);
        }
        this.run();
    }

    initiate() {
        if (this.isRunning()) {
            this.run();
        }

        this.sleep();
    }

    getSelf() {
        // api call
        // setEnabled(apicall.enabled)
    }
}

// GET scooters from database
// for scooter in db:
//      scoot = new Scooter(scooter.id, scooter.position);
//      scoot.sleep();
