describe "Hash polyfill" do
  it "compact" do
    a = {x: true, y: nil, z: false}
    b = a.compact
    expect(a).to eq({x: true, y: nil, z: false})
    expect(b).to eq({x: true, z: false})
  end

  it "compact!" do
    a = {x: true, y: nil, z: false}
    expect(a.compact!).to eq(a)
    expect(a.compact!).to eq(nil)
    expect(a).to eq({x: true, z: false})
  end

  it "select_values - with block" do
    a = {a: 2, b: 3, c: 4, d: 5}
    b = a.select_values(&:even?)
    c = a.select_values(&:odd?)
    expect(a).to eq({a: 2, b: 3, c: 4, d: 5})
    expect(b).to eq({a: 2, c: 4})
    expect(c).to eq({b: 3, d: 5})
  end

  it "select_values! - with block" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.select_values!(&:even?)).to eq(a)
    expect(a.select_values!(&:even?)).to eq(nil)
    expect(a).to eq({a: 2, c: 4})
  end

  it "reject_values - with block" do
    a = {a: 2, b: 3, c: 4, d: 5}
    b = a.reject_values(&:even?)
    c = a.reject_values(&:odd?)
    expect(a).to eq({a: 2, b: 3, c: 4, d: 5})
    expect(b).to eq({b: 3, d: 5})
    expect(c).to eq({a: 2, c: 4})
  end

  it "reject_values! - with block" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.reject_values!(&:even?)).to eq(a)
    expect(a.reject_values!(&:even?)).to eq(nil)
    expect(a).to eq({b: 3, d: 5})
  end

  # Doing anything more than .with_index or .each with them is going to be confusing
  it "select_values - no block yields Enumerator" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.select_values).to be_instance_of(Enumerator)
    b = a.select_values.each(&:even?)
    expect(a).to eq({a: 2, b: 3, c: 4, d: 5})
    expect(b).to eq({a: 2, c: 4})
    b = a.select_values.map(&:even?)
    expect(b).to eq([true, false, true, false])
  end

  it "select_values! - no block yields Enumerator" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.select_values!).to be_instance_of(Enumerator)
    b = a.select_values!.each(&:even?)
    expect(a).to eq({a: 2, c: 4})
    expect(b).to eq(a)
  end

  it "reject_values - no block yields Enumerator" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.reject_values).to be_instance_of(Enumerator)
    b = a.reject_values.each(&:even?)
    expect(a).to eq({a: 2, b: 3, c: 4, d: 5})
    expect(b).to eq({b: 3, d: 5})
    b = a.reject_values.map(&:even?)
    expect(b).to eq([true, false, true, false])
  end

  it "reject_values! - no block yields Enumerator" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.reject_values!).to be_instance_of(Enumerator)
    b = a.reject_values!.each(&:even?)
    expect(a).to eq({b: 3, d: 5})
    expect(b).to eq(a)
  end

  # Ruby 2.4 polyfill
  # map! always returns self, which is different from select!/reject! which return self or nil
  it "transform_values - with block" do
    a = {a: 2, b: 3, c: 4, d: 5}
    b = a.transform_values(&:next)
    expect(a).to eq({a: 2, b: 3, c: 4, d: 5})
    expect(b).to eq({a: 3, b: 4, c: 5, d: 6})
  end

  it "transform_values! - with block" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.transform_values!(&:next)).to eq(a)
    expect(a.transform_values!(&:itself)).to eq(a)
    expect(a).to eq({a: 3, b: 4, c: 5, d: 6})
  end

  it "transform_values - no block yields Enumerator" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.transform_values).to be_instance_of(Enumerator)
    b = a.transform_values.each(&:next)
    expect(a).to eq({a: 2, b: 3, c: 4, d: 5})
    expect(b).to eq({a: 3, b: 4, c: 5, d: 6})
  end

  it "transform_values! - no block yields Enumerator" do
    a = {a: 2, b: 3, c: 4, d: 5}
    expect(a.transform_values!).to be_instance_of(Enumerator)
    expect(a.transform_values!.each(&:next)).to eq(a)
    expect(a.transform_values!.each(&:itself)).to eq(a)
    expect(a).to eq({a: 3, b: 4, c: 5, d: 6})
  end
end
