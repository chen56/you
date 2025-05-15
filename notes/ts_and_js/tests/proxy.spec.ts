import { describe, it } from 'vitest';
import assert from 'node:assert';

describe('example', () => {
  it('proxy hello', () => {
    assert.strictEqual(1, 1);
    const person = {
      name: {
        first: 'Alice',
        last: 'Smith',
      },
      age: 25,
    };

    let log = "";
    // 创建 Proxy 来监听字段访问
    const proxyPerson = new Proxy(person, {
      get(target, property, receiver) {
        log += (`访问了${JSON.stringify(target)}的字段: ${String(property)}`);
        return Reflect.get(target, property, receiver);
      },
    });

    // 访问字段
    proxyPerson.name.first;
    assert.strictEqual(log, '访问了{"name":{"first":"Alice","last":"Smith"},"age":25}的字段: name');

    log = "";
    proxyPerson.age;
    assert.strictEqual(log, '访问了{"name":{"first":"Alice","last":"Smith"},"age":25}的字段: age');
  });


  describe('Deep Proxy', () => {
    let log = "";


    function createDeepProxy<T extends Object>(obj: T): T {
      return new Proxy(obj, {
        get(target, property, receiver) {
          log += (`访问了${JSON.stringify(target)}的字段: ${String(property)};`);

          const value = Reflect.get(target, property, receiver);

          // 如果值是对象，则递归创建 Proxy
          if (value && typeof value === 'object') {
            return createDeepProxy(value);
          }

          return value;
        },
      });
    }

    it('Deep Proxy 1', () => {


      const person = {
        name: {
          first: 'Alice',
          last: 'Smith',
        },
        age: 25,
      };

      const proxyPerson = createDeepProxy(person);
      log = "";
      proxyPerson.name.first;
      assert.strictEqual(log, '访问了{"name":{"first":"Alice","last":"Smith"},"age":25}的字段: name;访问了{"first":"Alice","last":"Smith"}的字段: first;');

    });



    it('Deep Proxy: null field', () => {
      const person: { name?: { first: string, last: string } | null } = {
        name: null
      };
      const proxyPerson = createDeepProxy(person);
      log = "";
      proxyPerson.name?.first;
      assert.strictEqual(log, '访问了{"name":null}的字段: name;');
    })

  });
});