package _724
{
   import _741._745;
   import _741._750;
   import _741._751;
   
   public class _733 extends _728
   {
      public function _733(param1:_745, param2:String)
      {
         super(param1);
         this._5873 = param1.path;
         this._name = this._path = param2;
      }
      
      public function get _5840() : _751
      {
         if(_5874 == null || _5874.length == 0)
         {
            return null;
         }
         return _5874[0] as _751;
      }
      
      override public function _4188() : Boolean
      {
         if(this._5840 == null)
         {
            return false;
         }
         var _loc1_:Boolean = this._5840._4188();
         return super._4188() || _loc1_;
      }
      
      public function _4160() : String
      {
         if(this._5840 == null)
         {
            return null;
         }
         return this._5840._5900();
      }
      
      public function _4185(param1:String) : Boolean
      {
         if(this._5840 == null)
         {
            return false;
         }
         return this._5840._5902(param1);
      }
      
      public function _10582(param1:String) : Boolean
      {
         if(this._5840 == null)
         {
            return false;
         }
         return this._5840._10582(param1);
      }
      
      public function _5846(param1:String) : void
      {
         var _loc2_:_751 = null;
         _5887.length = 0;
         _5874.length = 0;
         _loc2_ = _750._5901(param1) as _751;
         _name = _loc2_.name;
         _loc2_.group = _734.GROUP_FOLDER;
         _5874.push(_loc2_);
      }
   }
}

