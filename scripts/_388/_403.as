package _388
{
   import _1404._1407;
   import _1404._1420;
   import _51._50;
   import _521._532;
   import _555._13201;
   import _708._717;
   import _73.SymbolType;
   import _93._92;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   
   public class _403 extends _92
   {
      private var _2986:Array;
      
      public function _403()
      {
         super();
         _2219 = true;
         _2215 = false;
      }
      
      override public function execute() : void
      {
         var _loc1_:_1420 = null;
         if(Boolean(_2212) && Boolean(_2212.stage))
         {
            _loc1_ = _2212.stage.focus as _1420;
         }
         if(SystemInfo.isMacOS && Boolean(_loc1_))
         {
            _loc1_.setSelection(0,_loc1_.length);
         }
         else
         {
            if(this._2865 == null || this._2865._1811 == SymbolType.COMIC)
            {
               return;
            }
            if(this._2865._1811 == SymbolType.SHEET)
            {
               this._13242.selectAll();
            }
            else
            {
               this._2226._14440 = _532.instance._3349(this._2865);
               this._2986 = this._2226._2889;
               this._3350();
               this._2226._14439();
            }
         }
      }
      
      private function _3350() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc1_:String = "";
         if(this._2986)
         {
            if(this._2986 is String)
            {
               _loc1_ = this._2986 as String;
            }
            else if(this._2986 is Array)
            {
               _loc2_ = this._2986 as Array;
               if(_loc2_.length)
               {
                  if(_loc2_.length == 1)
                  {
                     if(_loc2_[0] is String)
                     {
                        _loc1_ = _loc2_[0];
                     }
                     else if(_loc2_[0].hasOwnProperty("name"))
                     {
                        _loc1_ = _loc2_[0].name;
                     }
                  }
                  else
                  {
                     _loc3_ = 0;
                     for each(_loc4_ in _loc2_)
                     {
                        if(_loc4_.hasOwnProperty("name"))
                        {
                           _loc3_++;
                        }
                     }
                     _loc1_ = tr("Tip.Select.Show",_loc3_);
                  }
               }
            }
         }
         if(_loc1_.length)
         {
            _2212._3334._3351(_loc1_,_717.HIGH_LIGHT);
         }
         else
         {
            _2212._3334._3344(_717.HIGH_LIGHT);
         }
      }
      
      private function get _2865() : _50
      {
         if(Boolean(_2214._1844) && Boolean(_2214._1844._2871))
         {
            return _2214._1844._2871._2865;
         }
         return null;
      }
      
      private function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
      
      private function get _13242() : _13201
      {
         return _1407.getInstance(_13201);
      }
   }
}

