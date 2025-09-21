// noinspection JSUnusedAssignment,PointlessBooleanExpressionJS
// noinspection JSUnusedAssignment,PointlessBooleanExpressionJS

import { describe, expect, it } from "vitest";

describe('type ', () => {
    it('type equals', () => {
        expect(Array === Array).toBe(true);
        expect(typeof Array).toBe("function");
    });
    it('type name', () => {
        const type: any = Array;
        expect(type !== "Array").toBe(true);
        expect(type.name === "Array").toBe(true);
    });

    it('instanceof', () => {
        expect([] instanceof Array).toBe(true);
        expect(!([] instanceof Array)).toBe(false);
    });
});
