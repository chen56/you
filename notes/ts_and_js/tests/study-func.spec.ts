// noinspection JSUnusedAssignment,PointlessBooleanExpressionJS
// noinspection JSUnusedAssignment,PointlessBooleanExpressionJS

import {describe, expect, it} from "vitest";

describe('anonymous function ', () => {
  it('1', () => {
    let x = (function (): string {
      return "hi";
    }())
    expect((function (): string {
      return "hi";
    }())).toBe("hi");
  });
  it('2', () => {
    let x = (function (): string {
      return "hi";
    })()
    expect(x).toBe("hi");
  });
  it('3', () => {
    let x = function (): string {
      return "hi";
    }()
    expect(x).toBe("hi");
  });

});
