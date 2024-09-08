package _477
{
   import _13503._13502;
   import _51._50;
   
   public class _478 extends _494
   {
      private var _3605:String;
      
      private var _3607:String;
      
      public function _478(param1:String, param2:String)
      {
         super();
         this._3605 = param2;
         this._3607 = param1;
      }
      
      override public function run() : void
      {
         var _loc2_:_13502 = null;
         var _loc1_:_50 = _3238.dragonBonesVO._2107(this._3607);
         if(_loc1_)
         {
            _loc2_ = _loc1_._13656(this._3605);
            if(_loc2_)
            {
               _loc2_._1868();
               complete();
            }
            else
            {
               fail(ExportController.EXPORT_ERROR_UNKNOW);
            }
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_UNKNOW);
         }
      }
   }
}

