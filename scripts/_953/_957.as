package _953
{
   import _1038._1037;
   import _1185._1186;
   import _127._130;
   import _51._70;
   import _51._79;
   import _948._950;
   import _97._103;
   
   public class _957 extends _130
   {
      public function _957()
      {
         super();
         mouseEnabled = false;
         mouseChildren = false;
         itemRenderer = _950;
         layout = new _1186();
      }
      
      public function dispose() : void
      {
      }
      
      public function _6777(param1:_79) : Boolean
      {
         return this.dataProvider.getItemIndex(param1) != -1;
      }
      
      public function _5337(param1:Array) : void
      {
         var _loc2_:_79 = null;
         for each(_loc2_ in this.dataProvider)
         {
            if(param1.indexOf(_loc2_.parentBoneData) != -1)
            {
               _103._2276.addItem(_loc2_);
               this.dataProvider._4016(_loc2_);
            }
         }
      }
      
      public function _5354(param1:_79) : void
      {
         if((this.dataProvider as _1037).getItemIndex(param1) != -1)
         {
            _103._2276.addItem(param1);
            this.dataProvider._4016(param1);
         }
      }
      
      public function _5374(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:_1037 = this.dataProvider as _1037;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = int(param1.indexOf(_loc3_));
            if(_loc2_ == -1)
            {
               _loc4_.removeItemAt(_loc5_);
               _loc5_--;
            }
            else
            {
               param1.splice(_loc2_,1);
            }
            _loc5_++;
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _70)
            {
               _loc3_ = (_loc3_ as _70)._1760;
            }
            if(_loc3_ is _79)
            {
               if(param1.length == 1 && (_loc3_ as _79)._2112())
               {
                  break;
               }
               _103._2276.addItem(_loc3_);
               _loc4_.addItem(_loc3_);
            }
         }
      }
      
      public function _2939() : void
      {
         var _loc1_:* = undefined;
         for each(_loc1_ in dataProvider)
         {
            _103._2276.addItem(_loc1_);
            dataProvider._4016(_loc1_);
         }
      }
      
      public function _6229(param1:_79) : void
      {
      }
      
      public function _6776() : void
      {
      }
   }
}

