class CheckinStatus {
    CheckinStatusMessage? message;

    CheckinStatus({
        this.message,
    });

}

class CheckinStatusMessage {
    bool? success;
    MessageMessage? message;
    CheckinStatusMessage({
        this.success,
        this.message,
    });

}
class MessageMessage {
    dynamic checkInTime;
    dynamic checkOutTime;
    dynamic currentStatus;
    dynamic vehicleType;

    MessageMessage({
        this.checkInTime,
        this.checkOutTime,
        this.currentStatus,
        this.vehicleType,
    });

}
