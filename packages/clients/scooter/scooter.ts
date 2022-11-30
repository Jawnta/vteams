class Scooter {
    protected id: number;
    protected enabled: boolean;
    protected available: boolean;
    protected inMaintenance: boolean;
    protected position: string; //change this
    protected speed: number;
    protected charge: number;

    constructor(id: number, position: string) {
        this.id = id;
        this.enabled = false;
        this.available = false;
        this.inMaintenance = false;
        this.position = position;
        this.speed = 0;
        this.charge = 0;
    }

    getId() {
        return this.id;
    }

    setId(id: number) {
        this.id = id;
    }

    getEnabled() {
        return this.enabled;
    }

    setEnabled(enabled: boolean) {
        this.enabled = enabled;
    }

    getAvailable() {
        return this.available;
    }

    setAvailable(available: boolean) {
        this.available = available;
    }

    getInMaintenance() {
        return this.inMaintenance;
    }

    setInMaintenance(inMaintenance: boolean) {
        this.inMaintenance = inMaintenance;
    }

    getPosition() {
        return this.position;
    }

    setPosition(position: string) {
        this.position = position;
    }

    getSpeed() {
        return this.speed;
    }

    setSpeed(speed: number) {
        this.speed = speed;
    }

    getCharge() {
        return this.charge;
    }

    setCharge(charge: number) {
        this.charge = charge;
    }
}
