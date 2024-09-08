package _346
{
   import _1374.Alert;
   import _668._671;
   import _777._779;
   import egret.utils.tr;
   
   public class _366 extends _364
   {
      public function _366()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc2_:String = null;
         var _loc3_:_11494 = null;
         var _loc4_:_10606 = null;
         var _loc1_:_671 = _2214._11562(projectPath);
         if(_loc1_)
         {
            if(Boolean(_2214._1844) && Boolean(_2214._1844._2871))
            {
               _loc2_ = _2214._1844._2871.projectPath;
               _779.instance._3222(_loc2_);
            }
            _779.instance._3296(projectPath);
            if(!_3219._3298(_loc1_))
            {
               _779.instance._3222(projectPath);
               _loc3_ = new _11494();
               _loc3_._1572(_loc1_.path);
               _loc3_.execute();
               Alert.show(tr("OpenProject.fail"));
            }
            else
            {
               _loc4_ = new _10606();
               _loc4_._1572(true);
               _loc4_.execute();
            }
         }
      }
   }
}

