// noinspection JSUnusedAssignment,PointlessBooleanExpressionJS

import {describe, expect, it} from "vitest";

describe('study undefined', () => {
    it('可选链操作符（Optional Chaining Operator）返回值类型：T|undefined', () => {
        let r: Array<string> | undefined;
        expect(r?.length).toBe(undefined);
    });
});
describe('null & undefined', () => {
    it('如何判断',  () => {
            let r: string | undefined;
            r = undefined;
            expect(r).toBe(undefined);
            expect(r === undefined).toBe(true);
            expect(r == undefined).toBe(true);
            expect(r == null).toBe(true);
            expect(r !== null).toBe(true);
            r = null;
            expect(r == null).toBe(true);
            expect(r === null).toBe(true);
            expect(r !== undefined).toBe(true);
        });
});
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
});
