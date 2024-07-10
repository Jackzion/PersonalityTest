export  class ArrayDataSource<T> implements IDataSource{

  private data: T[] ;

  constructor(data: T[]) {
    this.data = data;
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    throw new Error('Method not implemented.');
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  throw new Error('Method not implemented.');
  }

  getData(index: number) {
    return this.data[index];
  }

  totalCount(): number {
    return this.data.length;
  }


}