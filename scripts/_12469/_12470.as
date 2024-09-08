package _12469
{
   public class _12470 extends _12472
   {
      public var account:_12471;
      
      public var custom:_12473;
      
      public var layout:_12472;
      
      public var preference:_12474;
      
      public function _12470()
      {
         this.account = new _12471();
         this.custom = new _12473();
         this.layout = new _12472();
         this.preference = new _12474();
         super();
         this._11139("account",this.account.obj);
         this._11139("custom",this.custom.obj);
         this._11139("preference",this.preference.obj);
      }
      
      public function set version(param1:String) : void
      {
         this._11139("version",param1);
      }
      
      public function set hotkey(param1:Object) : void
      {
         this._11139("hotkey",param1);
      }
   }
}

