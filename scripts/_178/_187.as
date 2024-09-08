package _178
{
   import flash.utils.Dictionary;
   
   public class _187
   {
      public var name:String;
      
      public var _2763:Boolean;
      
      public var isRelativePivot:Boolean;
      
      private var _2761:Vector.<_180>;
      
      private var _2757:Dictionary;
      
      public function _187()
      {
         this._2761 = new Vector.<_180>(0,true);
         this._2757 = new Dictionary();
         super();
      }
      
      public function dispose() : void
      {
         var _loc1_:_180 = null;
         for each(_loc1_ in this._2761)
         {
            _loc1_.dispose();
         }
         this._2761.fixed = false;
         this._2761.length = 0;
         this._2761 = null;
         this._2760();
         this._2757 = null;
      }
      
      public function get _2126() : Vector.<_180>
      {
         return this._2761;
      }
      
      public function _2758(param1:String) : _180
      {
         var _loc2_:int = int(this._2761.length);
         while(_loc2_--)
         {
            if(this._2761[_loc2_].name == param1)
            {
               return this._2761[_loc2_];
            }
         }
         return null;
      }
      
      public function _2128(param1:_180) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2761.indexOf(param1) < 0)
         {
            this._2761.fixed = false;
            this._2761[this._2761.length] = param1;
            this._2761.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function _2125(param1:_180) : void
      {
         var _loc2_:int = int(this._2761.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._2761.fixed = false;
            this._2761.splice(_loc2_,1);
            this._2761.fixed = true;
         }
      }
      
      public function _2755(param1:String) : void
      {
         var _loc2_:int = int(this._2761.length);
         while(_loc2_--)
         {
            if(this._2761[_loc2_].name == param1)
            {
               this._2761.fixed = false;
               this._2761.splice(_loc2_,1);
               this._2761.fixed = true;
            }
         }
      }
      
      public function _2759(param1:String) : _186
      {
         return this._2757[param1];
      }
      
      public function _1766(param1:_186) : void
      {
         this._2757[param1.name] = param1;
      }
      
      public function _2756(param1:String) : void
      {
         delete this._2757[param1];
      }
      
      public function _2760() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this._2757)
         {
            delete this._2757[_loc1_];
         }
      }
      
      public function _2655() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = int(this._2761.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = 0;
            _loc4_ = int(this._2761[_loc1_]._1963.length);
            while(_loc3_ < _loc4_)
            {
               this._2761[_loc1_]._1963[_loc3_].duration *= this._2761[_loc1_]._1963[_loc3_].scale;
               _loc5_ = 0;
               _loc6_ = int(this._2761[_loc1_]._1963[_loc3_]._1745.length);
               while(_loc5_ < _loc6_)
               {
                  this._2761[_loc1_]._1963[_loc3_]._1745[_loc5_]._2655(this._2761[_loc1_]._1963[_loc3_].scale);
                  _loc5_++;
               }
               _loc5_ = 0;
               _loc6_ = int(this._2761[_loc1_]._1963[_loc3_]._2695.length);
               while(_loc5_ < _loc6_)
               {
                  this._2761[_loc1_]._1963[_loc3_]._2695[_loc5_]._2655(this._2761[_loc1_]._1963[_loc3_].scale);
                  _loc5_++;
               }
               _loc3_++;
            }
            _loc1_++;
         }
      }
   }
}

