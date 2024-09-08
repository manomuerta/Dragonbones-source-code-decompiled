package _724
{
   import _741._746;
   import _81._90;
   import _859._860;
   
   public class _725 implements _90
   {
      public static const STATUS_NEW:int = 0;
      
      public static const STATUS_LOADING:int = 1;
      
      public static const STATUS_NORMAL:int = 2;
      
      public static const STATUS_MISSING:int = 3;
      
      public static const STATUS_LIMIT:int = 4;
      
      protected var _name:String;
      
      protected var _path:String;
      
      protected var _5873:String;
      
      protected var _1563:int;
      
      public var width:Number;
      
      public var height:Number;
      
      public var _2166:Number;
      
      public var _2167:Number;
      
      public var reference:Vector.<_860>;
      
      protected var _5874:Vector.<_746>;
      
      public function _725(param1:Vector.<_746> = null)
      {
         super();
         this._5874 = param1;
         this.reference = new Vector.<_860>();
      }
      
      public function _4188() : Boolean
      {
         return false;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get path() : String
      {
         return this._path;
      }
      
      public function get _2682() : String
      {
         return this._5873;
      }
      
      public function get missing() : Boolean
      {
         return this._1563 == STATUS_MISSING;
      }
      
      public function _5735(param1:_860) : void
      {
         if(this.reference.indexOf(param1) >= 0)
         {
            return;
         }
         this.reference.push(param1);
      }
      
      public function _5725(param1:_860) : void
      {
         var _loc2_:int = int(this.reference.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.reference.splice(_loc2_,1);
         }
      }
      
      public function _2108(param1:Function) : void
      {
      }
      
      public function dispose() : void
      {
      }
      
      public function _10584() : Vector.<String>
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Vector.<String> = new Vector.<String>();
         if(this._5874)
         {
            _loc1_ = 0;
            _loc2_ = int(this._5874.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_.push(this._5874[_loc1_].path);
               _loc1_++;
            }
         }
         return _loc3_;
      }
   }
}

