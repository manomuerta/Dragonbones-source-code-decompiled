package _11106
{
   import _11111._11110;
   
   public class _11107
   {
      protected var _name:String;
      
      protected var _11752:String;
      
      protected var _3786:Object;
      
      protected var success:Boolean;
      
      protected var _11164:String;
      
      protected var category:String;
      
      public function _11107(param1:String)
      {
         this._3786 = {};
         super();
         this.init(param1);
      }
      
      public function init(param1:String) : void
      {
         this._name = param1;
         this.category = param1;
      }
      
      public function _11130(param1:String) : void
      {
         this.success = true;
         this._11752 = param1;
         this._3786 = {};
         this._13394();
      }
      
      public function _11139(param1:String, param2:String) : void
      {
         this._3786[param1] = param2;
      }
      
      public function fail(param1:String) : void
      {
         this.success = false;
         this._11164 = param1;
      }
      
      public function _11132() : void
      {
         var _loc1_:String = null;
         _11110.instance.trackEvent(_11109.Action,this.category,this._11752);
         if(this._name != this.category)
         {
            _11110.instance.trackEvent(this.category,this._name);
         }
         for(_loc1_ in this._3786)
         {
            _11110.instance.trackEvent(this._name,_loc1_,this._3786[_loc1_]);
         }
         if(!this.success)
         {
            _11110.instance.trackEvent(_11109.Fail,this._name,this._11164);
         }
      }
      
      protected function _13394() : void
      {
         if(_11108.UI.indexOf(this._11752) != -1)
         {
            _11110.instance.trackEvent(_11109.UI,this._11752,this._name);
         }
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get _11163() : String
      {
         return this._11752;
      }
   }
}

